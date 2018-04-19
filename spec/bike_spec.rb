require 'bike'

describe Bike do
  describe '#report_broken', :report_broken do
    it 'can be reported broken' do
      subject.report_broken
      expect(subject).to be_broken
      expect(subject).not_to be_working
    end
  end
end
