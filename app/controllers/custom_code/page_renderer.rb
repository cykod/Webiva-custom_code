

class CustomCode::PageRenderer < ParagraphRenderer

  paragraph :custom_code, :ajax => true

  def custom_code
    @options = paragraph_options(:custom_code)
  
    data = {}

    paragraph_output = ''
    begin 
      data = self.instance_eval(@options.code)
      if !paragraph_rendered?
        paragraph_output = render_to_string :inline => @options.view, :locals => data
      end
    rescue Exception => e
      paragraph_output = "Error:" + e.to_s
    end
    
    if paragraph_output
      render_paragraph :text => paragraph_output
    end
  end


end
