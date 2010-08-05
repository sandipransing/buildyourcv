class BYCForm < ActionView::Helpers::FormBuilder  

  def self.create_tagged_field(method_name)
    define_method(method_name) do |name, *args|
      if object && object.errors.any?
        errors = [ object.errors.on(name.to_sym) ].flatten.compact
        errors = errors.collect{|e| "#{name.to_s.humanize} #{e}"}.join(', ') if errors.kind_of? Array
      end 

      # initialize some local variables
      label = klass = ''

      if args.last.is_a?(Hash)
        arg_label = args.last[:label].to_s
        arg_suffix = args.last[:suffix].to_s
        arg_klass = args.last[:class].to_s
        arg_required = args.last[:required].to_s
      end

      #Label text, titlize field name if a custom label isn't passed
      label = arg_label.blank? ? name.to_s.titleize : arg_label
      #Lable none then make it nil
      label = nil if label == 'none'
      klass = case method_name
              when 'text_field', 'password_field', 'date_select', 'datetime_select'
                'input_field'
              end
      klass = klass.present? ? {:class => klass} : {}
      tag = ""
      tag << @template.content_tag(:label, label, :for => "#{@object_name}_#{name}") if label 
      etag = method_name == 'select' ? super : super(name, klass)
      # Required Field Notations
      # all: add required notation for all form methods
      # new: only for 'create new' forms, using the form in 'edit' mode should disregard
        etag << @template.content_tag("strong", "*") if arg_required == 'all' || (arg_required == 'new' && object.new_record?)
      etag<<@template.content_tag(:div, errors, :class => :error) if errors.present?
      @template.content_tag :li, tag<<etag
    end
  end

  helpers = %w[check_box text_field text_area password_field select date_select datetime_select file_field collection_select state_select label]
  helpers.each do |name|
    create_tagged_field(name)
  end
end
