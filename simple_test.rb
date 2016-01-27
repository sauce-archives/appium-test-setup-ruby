require 'appium_lib'

desired_caps = {
  caps:       {
    testobject_api_key: ENV['TESTOBJECT_API_KEY'],
    testobject_app_id: '1',
    testobject_device: 'Motorola_Moto_G_2nd_gen_real'
  },
  appium_lib: {
    server_url: 'https://app.testobject.com:443/api/appium/wd/hub',
    wait: 10
  }
}

# Start the driver
Appium::Driver.new(desired_caps).start_driver

module Komoot
  module Android
    # Add all the Appium library methods to Test to make
    # calling them look nicer.
    Appium.promote_singleton_appium_methods Komoot

    find_element(:id, 'de.komoot.android:id/button_mail_login').click
    find_element(:id, 'de.komoot.android:id/txt_user_name').send_keys("jfjfkdl")
    find_element(:id, 'de.komoot.android:id/txt_password').send_keys("lakjsdfja")
    find_element(:id, 'de.komoot.android:id/btn_login').click

    find_element(:id, "android:id/message")


    # Quit when you're done!
    driver_quit
    puts 'Tests Succeeded!'
  end
end
