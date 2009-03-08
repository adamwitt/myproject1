# Be sure to restart your server when you modify this file

Paperclip::Attachment.interpolations[:gender] = proc do |attachment, style|
  attachment.instance.gender
end