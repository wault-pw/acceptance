RSpec.describe 'https://github.com/wault-pw/eva' do
  describe 'SSL certificate' do
    subject do
      Cert.new(Eva.url)
    end

    it 'is not expired' do
      expect(subject.not_after.to_date).to be >= Date.today.next_day(14)
    end
  end

  describe 'meta tags' do
    subject do
      Webpage.new(Eva.url)
    end

    it 'works' do
      expect(subject).to have_status(200)
      expect(subject).to have_lang(Landing.lang)
      expect(subject).to have_title
      expect(subject).to have_description
      expect(subject).to have_favicon
    end
  end
end
