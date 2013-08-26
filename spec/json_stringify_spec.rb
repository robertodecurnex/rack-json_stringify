# encoding: utf-8

require 'spec_helper'

describe Rack::JsonStringify do

  before :each do
    @response_status = 200
    @response_headers = {
      'Content-Length' => '57'
    }
    @response_body = ['{"key1":666,"key2":"666","key3":[1,"2"],"key4":{"key5":3}}']

    @app = lambda do |params|
      [@response_status, @response_headers, @response_body]
    end
  end
  
  describe 'when an non stringified response is requested' do
    
    before :each do
      @request = Rack::MockRequest.env_for('/action.json')
      @non_stringified_response = Rack::JsonStringify.new(@app).call(@request)
      @non_stringified_response_status, @non_stringified_response_headers, @non_stringified_response_body = @non_stringified_response
    end

    it 'should not modify the response  status code' do
      @non_stringified_response_status.should == @response_status
    end

    it 'should update the response content length to the new value' do 
      @non_stringified_response_headers['Content-Length'].should == @response_headers['Content-Length']
    end

    it 'should stringify every value of the response json' do
      @non_stringified_response_body.should == @response_body
    end

  end

  describe 'when an stringified response is requested' do
    
    before :each do
      @request = Rack::MockRequest.env_for('/action.json', {'X-ACCEPTED-TYPES' => 'String'})
      @stringified_response = Rack::JsonStringify.new(@app).call(@request)
      @stringified_response_status, @stringified_response_headers, @stringified_response_body = @stringified_response
    end

    it 'should not modify the response  status code' do
      @stringified_response_status.should == @response_status
    end

    it 'should update the response content length to the new value' do 
      @stringified_response_headers['Content-Length'].should == '64' 
    end

    it 'should stringify every value of the response json' do
      @stringified_response_body.should == ['{"key1":"666","key2":"666","key3":["1","2"],"key4":{"key5":"3"}}']
    end

  end

end
