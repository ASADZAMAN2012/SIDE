require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class ClickFooterLink < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://bellmore.nixon.i.patch.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_click_footer_link
    # -----------LOGIN ------------
    @driver.get(@base_url + "/")
    @driver.find_element(:xpath, "//ul[@id='nav_messages']/li[3]/a/strong").click
    @driver.find_element(:name, "email").clear
    @driver.find_element(:name, "email").send_keys "asad.zaman+admin@patch.com"
    @driver.find_element(:name, "password").clear
    @driver.find_element(:name, "password").send_keys "password"
    @driver.find_element(:id, "signin").click
    # -----------POST SMOETHING ------------
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Post Something[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Click on "Post on the Boards" link
    @driver.find_element(:link, "Post on the Boards").click
    assert_match /All Boards in .* Patch/, @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*All Boards[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Make an announcement, speak your mind, or sell something[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Post an Event" link
    @driver.find_element(:link, "Post an Event").click
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Create an event[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert_match /Post on Patch — Patch.com/, @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Post Now[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Write a Review" link
    @driver.find_element(:link, "Write a Review").click
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*New Reviews & Posts[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert_match /Businesses on .*/, @driver.title
    assert !60.times{ break if (element_present?(:link, "Claim a listing") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:css, "i.inline-icon.icon_scroll-left") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:css, "i.inline-icon.icon_scroll-right") rescue false); sleep 1 }
    # Warning: waitForTextPresent may require manual changes
    assert !60.times{ break if (@driver.find_element(:css, "BODY").text =~ /^[\s\S]*Categories[\s\S]*$/ rescue false); sleep 1 }
    # Warning: waitForTextPresent may require manual changes
    assert !60.times{ break if (@driver.find_element(:css, "BODY").text =~ /^[\s\S]* Get the daily newsletter[\s\S]*$/ rescue false); sleep 1 }
    @driver.navigate.back
    # Click on "Start a Blog" link
    @driver.find_element(:link, "Start a Blog").click
    assert_match /Start a blog on .*/, @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Start a blog[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Name your blog [\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Describe your blog [\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Blog Icon [\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Upload your own photo[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:id, "avatar_upload") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:id, "create_group_btn") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:link, "Cancel") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:link, "Need help? Get it here »") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Select a name that best reflects what you are going to write about\. Keep it short and simple![\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # -----------YOUR ACCOUNT ------------
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Your Account[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Click on "Your Profile" link
    @driver.find_element(:xpath, "(//a[contains(text(),'Your Profile')])[2]").click
    assert_match /.* — Patch.com/, @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Posts[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Comments[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: waitForTextPresent may require manual changes
    assert !60.times{ break if (@driver.find_element(:css, "BODY").text =~ /^[\s\S]*Recent Activity[\s\S]*$/ rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:link, "Edit") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Show Me How[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Edit Profile" link
    @driver.find_element(:xpath, "(//a[contains(text(),'Edit Profile')])[2]").click
    assert_equal "Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Edit Profile[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Profile Picture[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:id, "avatar_upload") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Name[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "name") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Gender[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "gender") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Home Patch[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "hometown") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Resident since \(Optional\)[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "month") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:name, "day") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:name, "year") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*I am a\.\.\. \(Optional\)[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*A little more about me \(optional\)[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "bio") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*What I love about my community \(optional\)[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "favorite") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:id, "save") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:link, "Cancel") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Show Me How[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Updates" link
    @driver.find_element(:link, "Updates").click
    assert_equal "Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Pending Updates[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*All Updates[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Show Me How[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Your Posts" link
    @driver.find_element(:xpath, "(//a[contains(text(),'Your Posts')])[2]").click
    assert_equal "Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Your Posts[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "//a[contains(@href, '#new_drafts')]") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:xpath, "//a[contains(@href, '#submitted_drafts')]") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:xpath, "//a[contains(@href, '#scheduled_drafts')]") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:xpath, "//a[contains(@href, '#published_drafts')]") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Show Me How[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Email Settings" link
    @driver.find_element(:xpath, "(//a[contains(text(),'Email Settings')])[2]").click
    assert_equal "Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Email Settings[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Board Subscriptions[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Choose what else you want delivered by email[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Daily Newsletter[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "newsletter") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Send me the Bellmore Daily Newsletter [\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Comments[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:name, "commentPreferences") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Comments on a post I commented on [\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Posts[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Email me an update when someone[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='CommentOnPost'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Comments on my post[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='Repost'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Adds a category to my post[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='ToAuthorPostIsEdited'])") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='ToAuthorPostIsModerated'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Updates About My Blog\(s\)[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Email me an update when someone[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='FollowNotificationForModerator'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Subscribes to my blog[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='PostForModerator'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Posts to my blog[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='NewPostToModerate'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Submits a post that requires approval[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='PostEditedByAnotherManager'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Edits a published post or a post submitted for approval[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='PostRejectRemove'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Deletes a published post or a post submitted for approval[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:xpath, "(//input[@value='PostModeratedByAnotherManager'])") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Another manager of the group approves or rejects a post[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:id, "save") rescue false); sleep 1 }
    assert !60.times{ break if (element_present?(:link, "Cancel") rescue false); sleep 1 }
    @driver.navigate.back
    # -----------HELP ------------
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Help[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Click on "Help" link
    @driver.find_element(:link, "Contact us").click
    assert_equal "Contact Us — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Contact Us[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Help[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Sales and Advertising[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Jobs[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*News Tips[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Partnerships[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Media Inquiries[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.find_element(:xpath, "(//strong[@id='patch-info'])[2]").click
    # -----------PATCH INFO ------------
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Patch Info[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Click on "About Us" link
    @driver.find_element(:link, "About us").click
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*About Us[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*What is Patch[\s\S][\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Who's Behind Patch[\s\S][\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Where You Come In[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Giving Back[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*The People Behind Patch[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Management Team[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Terms of Use" link
    @driver.find_element(:link, "Terms of Use").click
    assert_equal "Terms — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Terms of Use[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "Privacy Policy" link
    @driver.find_element(:link, "Privacy Policy").click
    assert_equal "Privacy — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Privacy Policy[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # -----------PARTNER WITH US ------------
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Partner with Us[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # Click on "Claim your listing" link
    @driver.find_element(:link, "Claim your listing").click
    assert_equal "Claim Your Business — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Submit Claim[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:link, "support@patch.com") rescue false); sleep 1 }
    @driver.navigate.back
    # Click on "Add your business" link
    @driver.find_element(:link, "Add your business").click
    assert_equal "Claim Your Business — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*Submit Claim[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    @driver.navigate.back
    # Click on "PatchU" link
    @driver.find_element(:link, "PatchU").click
    assert_equal "PatchU — Patch.com", @driver.title
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*PatchU and Campus Recruiting[\s\S]*$/, @driver.find_element(:css, "BODY").text }
    assert !60.times{ break if (element_present?(:css, "#main > img") rescue false); sleep 1 }
    # Warning: verifyTextPresent may require manual changes
    verify { assert_match /^[\s\S]*What’s PatchU[\s\S][\s\S]*$/, @driver.find_element(:css, "BODY").text }
    # -----------LOGOUT ------------
    @driver.find_element(:xpath, "//div[@id='nav_personalize']/div/a/i").click
    @driver.find_element(:link, "Sign Out").click
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
