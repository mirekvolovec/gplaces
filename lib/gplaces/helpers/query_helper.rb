module Gplaces

  module QueryHelper
    extend self

    def query_hash(method, url, params)
      {
        :method => method,
        :url => url,
        :params => params
      }
    end

    def normalize_params(params)
      params[:location] = "#{"%.8f"%params.delete(:lat)},#{"%.8f"%params.delete(:lng)}" if (!params[:lat].nil? && !params[:lng].nil?)
      params[:types] = params[:types].map{|p| p.to_s}.join('|') if params[:types].is_a? Array

      params
    end

    def validate(required_params)
      required_params.each do |rp|
        raise "Can not find parameter #{rp}" if @params[rp].nil?
      end
    end

  end

end