RSpec.describe Sirample do
  it "has a version number" do
    expect(Sirample::VERSION).not_to be nil
  end
end

RSpec.describe 'Web' do
  it 'should allow homepage' do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.body).to eq ('Hello World')
  end
end
