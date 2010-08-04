BuildYourCV
========

### Gems
    - prawn (version 0.8.4)

### Models
<img src='https://github.com/sandipransing/buildyourcv/raw/master/models.png' width='500' align='center'>

### Migrations
    1. User
    ruby script/generate model user name:string tagline:string email:string mobile:string languages:string summary:text address:string landmark:string education:string website:string company:string designation:string areas_of_speciality:string birth_date:date nationality:string interests:text
    2. Education
    ruby script/generate model education user_id:integer year:integer where:string what:string grade:string
    3. Work Experience
    ruby script/generate model work_experience user_id:integer where:string summary:text from:date to:date title:string

### Developers
BuildYourCV Team

### Railroad
railroad -M -i -l | dot -Tpng models.png

### Special Thanks to 
Greg
