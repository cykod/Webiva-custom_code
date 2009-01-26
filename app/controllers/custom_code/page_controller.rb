

class CustomCode::PageController < ParagraphController

  editor_header 'Customcode Paragraphs'
  
  editor_for :custom_code, :name => "Custom Code"

  class CustomCodeOptions < HashModel
    attributes :code => '',:view => ''
    validates_presence_of :code
  end
  
  def custom_code
    if(myself.has_role?('admin_system'))
      @options = CustomCodeOptions.new(params[:custom_code] || paragraph.data)
      return if handle_module_paragraph_update(@options)
    end
  end

end
