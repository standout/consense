class Consent::ConsentPromptGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_view_file
    copy_file "consent_prompt.html.erb", "app/views/consent_prompts/#{file_name}.html.erb"
  end
end
