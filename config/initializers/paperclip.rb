module Paperclip
  module Interpolations
    def user_id attachment, style_name
      attachment.instance.user_id
    end
  end
end

