

class CustomCode::AdminController < ModuleController

  component_info 'CustomCode', :description => 'Customcode support', 
                              :access => :private
                              
  cms_admin_paths "options",
                   "Options" =>   { :controller => '/options' },
                   "Modules" =>  { :controller => '/modules' },
                   "Customcode Options" => { :action => 'index' }
 
 public 
 
 def options
    cms_page_path ['Options','Modules'],"Customcode Options"
    
    @options = self.class.module_options(params[:options])
    
    if request.post? && params[:options] && @options.valid?
      Configuration.set_config_model(@options)
      flash[:notice] = "Updated Customcode module options".t 
      redirect_to :controller => '/modules'
      return
    end    
  
  end
  
  def self.module_options(vals=nil)
    Configuration.get_config_model(Options,vals)
  end
  
  class Options < HashModel
  
  
  end
  
end
