RSpec::Matchers.define :have_no_content_within do |css|
  match do |actual|
    page.find(css).all("*").length == 0
  end

  failure_message_for_should do |actual|
    "expected that there is no content inside #{css}"
  end
end

