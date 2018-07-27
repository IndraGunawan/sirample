RSpec.describe Sirample do
  it "has a version number" do
    expect(Sirample::VERSION).not_to be nil
  end
end

RSpec.describe 'Web' do
  context 'Health check' do
    it 'should allow ping' do
      get '/ping'

      expect(last_response).to be_ok
      expect(last_response.body).to eq ('PONG')
    end
  end

  context 'staff' do
    it 'should get all record' do
      get '/staff'

      expect(last_response).to be_ok
      expect(last_response.body).to eq('SELECT * FROM staff')
    end

    it 'should get single record' do
      get '/staff/1'

      expect(last_response).to be_ok
      expect(last_response.body).to eq('SELECT * FROM staff WHERE id = ?')
    end

    it 'should put single record' do
      put '/staff/1', { name: 'myname' }.to_json

      expect(last_response).to be_ok
      expect(last_response.body).to eq("UPDATE staff SET name = 'myname' WHERE id = ?")
    end

    it 'should delete single record' do
      delete '/staff/1'

      expect(last_response).to be_ok
      expect(last_response.body).to eq('DELETE staff WHERE id = ?')
    end
  end
end
