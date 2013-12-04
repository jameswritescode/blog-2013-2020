class UiController < ApplicationController
  layout :choose_layout

  private

  def choose_layout
   case action_name
   when /^editor/ then 'editor'
   when /^admin_/ then 'admin'
   else 'ui'
   end
  end
end
