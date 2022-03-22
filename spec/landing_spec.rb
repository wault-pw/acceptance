RSpec.describe 'https://github.com/wault-pw/landing' do
  describe 'SSL certificate' do
    subject do
      Cert.new(Landing.url)
    end

    it 'is not expired' do
      expect(subject.not_after.to_date).to be >= Date.today.next_day(14)
    end
  end

  describe 'robots.txt' do
    subject do
      Robots.new("#{Landing.url}/robots.txt")
    end

    it 'works' do
      expect(subject).to be_exist
      expect(subject).to have_content("#{Landing.url}/sitemap.xml")
    end
  end

  describe 'sitemap.txt' do
    subject do
      Sitemap.new("#{Landing.url}/sitemap.xml")
    end

    it 'works' do
      expect(subject).to have_links
    end
  end

  describe 'meta tags' do
    subject do
      Webpage.new(Landing.url)
    end

    it 'works' do
      expect(subject).to have_status(200)
      expect(subject).to have_lang(Landing.lang)
      expect(subject).to have_title
      expect(subject).to have_description
      expect(subject).to have_favicon
    end
  end

  describe '404' do
    subject do
      Webpage.new(Landing.url + "/foo")
    end

    it 'works' do
      expect(subject).to have_status(404)
      expect(subject).to have_lang(Landing.lang)
      expect(subject).to have_title
      # TODO: add landing page 404 description
      # expect(subject).to have_description
    end
  end
end
