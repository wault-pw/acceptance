RSpec.describe 'https://github.com/wault-pw/alice' do
  describe 'SSL certificate' do
    subject do
      Cert.new(Alice.url)
    end

    it 'is not expired' do
      expect(subject.not_after.to_date).to be >= Date.today.next_day(14)
    end
  end

  describe 'SSH' do
    subject do
      Port.new(Alice.url)
    end

    it 'closed' do
      expect(subject).to have_closed(22)
    end
  end
end
