class LoginFormBuilder < ActionView::Helpers::FormBuilder
  %w(email_field password_field).each do |method_name|
    define_method method_name do |name, *args|
      unless @template.flash.instance_variable_get(:@flashes).empty?
        args.first[:class]       = "#{args.first[:class]} bad_field"
        args.first[:placeholder] = "please enter #{args.first[:placeholder]}"
      end unless object.nil?

      super(name, *args)
    end
  end
end
