require 'rails_helper'

describe Url do
  let(:original) {'http://rubyonrails.org'}
  let(:custom) {'ror'}
  
  describe '#self.create_link' do
    it 'creates an #to_s(36) identifier' do
      expect{
        link = Url.create_link( original )
        expect(link.identifier).to eql(link.url.id.to_s(36))
      }.to change{Url.count}.by(+1)
    end
    
    it 'creates an custom identifier' do
      expect{
        link = Url.create_link( original, custom )
        expect(link.identifier).to eql(custom)
      }.to change{Url.count}.by(+1)
    end
    
    it 'creates an  #to_s(36) identifier (custom url exists)' do
      expect{
        Url.create_link( original, custom )
        link = Url.create_link( original, custom )
        expect(link.identifier).to eql(link.url.id.to_s(36))
      }.to change{Url.count}.by(+2)
    end
    
    it 'creates an #to_s(36) identifier (custom url crahs againts #to_s(36))' do
      expect{
        Url.create_link( original)
        next_id = Url.maximum(:id).next

        identifier = (next_id + 1).to_s(36);

        link = Url.create_link( original, identifier )
        expect(link.url.id).to eql(next_id)
        expect(link.identifier).to eql(identifier)

        link = Url.create_link( original)
        expect(link.url.id).to eql(next_id + 2)
       }.to change{Url.count}.by(+3)
    end
  end

end

