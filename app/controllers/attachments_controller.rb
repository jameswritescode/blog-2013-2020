class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    attachment = Attachment.new(attachment: attachment_params[:file])

    respond_to do |format|
      if attachment.save
        format.json { render json: attachment.attachment }
      else
        format.json { render json: attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:file)
  end
end
