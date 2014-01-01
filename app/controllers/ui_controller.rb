class UiController < ApplicationController
  layout :choose_layout

  private

  def choose_layout
   case action_name
   when /^dashboard/ then 'dashboard'
   else 'ui'
   end
  end
end
