require 'prawn/layout'
class UsersController < ApplicationController
  before_filter :access_required, :except => [:new, :create]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    if @user.save
      case true
      when params[:email].present?
        flash[:notice] = "Your CV has been sent on email"
        EmailMailer.deliver_email_with_attachment(@user.email,draw_pdf)
      when params[:export].present?
        send_data draw_pdf, :filename => "yourcv.pdf", :type => "application/pdf" and return
      else
        flash[:notice] = 'User was successfully created.' 
      end
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  private
  def access_required
    flash[:error] = "You do not have access to view this page"
    redirect_to root_url
  end

  def draw_pdf
    pdf = Prawn::Document.new(:page_size => 'A4', :layout => 'portrait') do
      move_down(10)
      text "Sandip Ransing (FunOnRails)", :size => 15, :align => :right
      #stroke horizontal_rule
      stroke do
        rectangle [0,745], 525, 1
      end
      move_down(1)
      image 'public/images/sandip.png', :scale => 0.5, :position => :left
      move_down(5)
      text "ROR developer based in India", :size => 12
      text "Email: san2821@gmail.com", :size => 12

      move_down(21)
      text "Table using prawn", :style => :bold
      move_down(5)
      data = [
        ["Name", {:text => 'Sandip Ransing', :font_style => :bold, :colspan => 4 }],
        ["Address", {:text => 'SHIVAJINAGAR, PUNE 411005', :colspan => 4 }],
        ["Landmark",{:text => 'NEAR FC COLLEGE', :colspan => 4 }],
        ["Mobile","9860648108", {:text => "", :colspan => 3 }],
        ["Education", {:text => "Bachelor in Computer Engineering", :colspan => 4 }],
        ["Vehicle", 'Hero Honda',"Reg. No.", {:text => "MH 12 EN 921", :colspan => 3 }],
        ["Additional", "GDCA", "class", 'First', ""],
        [{:text => "Areas of Speciality", :font_style => :bold}, {:text => "Ruby, Rails, Radiant, Asterisk, Adhearsion, Geokit, Prawn, ....,...", :font_style => :bold, :colspan => 4}],
        [{:text => "Website", :colspan => 2},{:text => "www.funonrails.com", :colspan => 3}],
        [{:text => "Company", :colspan => 2},{:text => "Josh Software", :colspan => 3}]
      ]
      table data,
        :border_style => :grid, #:underline_header
        :font_size => 10,
        :horizontal_padding => 6,
        :vertical_padding => 3,
        :border_width => 0.7,
        :column_widths => { 0 => 130, 1 => 100, 2 => 100, 3 => 100, 4 => 80 },
        :position => :left,
        :align => { 0 => :left, 1 => :right, 2 => :left, 3 => :right, 4 => :right }

    end
    pdf.render
  end
end
