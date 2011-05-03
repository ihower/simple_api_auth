require 'spec_helper'

describe SimpleApiAuth do
    
    before do
      SimpleApiAuth::Middleware.api_key = "abc"
    end
    
    let(:app) {
      Rack::Builder.new do
        use SimpleApiAuth::Middleware
        run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ["Hello, World!"]] }
      end      
    }
    
    describe SimpleApiAuth::Middleware do
      it "should pass if request is not for /api" do
        response = Rack::MockRequest.new(app).get('/')
        response.status.should == 200
      end
      
      it "should pass if request is authorized by header" do
        
        response = Rack::MockRequest.new(app).get('/api/test', "HTTP_AUTHORIZATION" => "abc" )
        response.status.should == 200
      end
            
      it "should pass if request is authorized by params[:api_key]" do
        response = Rack::MockRequest.new(app).get('/api/test?api_key=abc')
        response.status.should == 200
      end
      
      it "should return 401 if request is unauthorized" do
        response = Rack::MockRequest.new(app).get('/api/test')
        response.status.should == 401
      end
    end
    
    describe "#generate" do
      it "should generate a random string" do
        SimpleApiAuth.generate.should be_a_kind_of String
        SimpleApiAuth.generate.size.should == 40
      end
    end
end