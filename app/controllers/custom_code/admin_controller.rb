

class CustomCode::AdminController < ModuleController

  component_info 'CustomCode', :description => 'Customcode support', 
                              :access => :private
                              
  cms_admin_paths "options", { }
                 
 
  
end
