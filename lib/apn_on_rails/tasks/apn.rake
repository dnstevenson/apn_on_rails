namespace :apn do
  
  namespace :notifications do
    
desc "Deliver all unsent APN notifications."
    task :deliver => [:environment] do
      APN::Notification.send_notifications(APN::Notification.find(:all, :conditions => ["sent_at is null and device_type = 'iphone'"]))
    end

desc "Deliver all unsent APN notifications."
    task :deliver_iphone_free => [:environment] do
      APN::Notification.send_notifications(APN::Notification.find(:all, :conditions => ["sent_at is  null and device_type = 'iphone-free'"]))
    end

desc "Deliver all unsent APN notifications."
    task :deliver_ipad => [:environment] do
      APN::Notification.send_notifications(APN::Notification.find(:all, :conditions => ["sent_at is  null and device_type = 'ipad'"]))
    end
desc "Deliver all unsent APN notifications."
    task :deliver_filmapp_iphone => [:environment] do
      APN::Notification.send_notifications(APN::Notification.find(:all, :conditions => ["sent_at is  null and device_type = 'filmapp-iphone'"]))
    end
end    
  end # notifications
  
  namespace :feedback do
    
    desc "Process all devices that have feedback from APN."
    task :process => [:environment] do
      APN::Feedback.process_devices
    end
    
  end
  
end # apn