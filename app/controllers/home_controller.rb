class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=DEBCA64B-1844-4C7C-8207-65BE6815683D'
    @uri =  URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    #check for empty results
    if @output.empty?
        @final_output = "Error"
    else
      @final_output = @output [0]["AQI"]
    end

    if @final_output == "Error" 
      @api_color = "grey"
      @api_description = "Try to enter the zipcode again !!!"
    elsif @final_output <= 50 
      @api_color = "green"
      @api_description = "The Air quality is Good and Healthy"
    elsif @final_output >= 51 && @final_output <=100 
      @api_color = "yellow"
      @api_description = "The Air quality is Moderate"
    elsif @final_output >= 101 && @final_output <=150 
      @api_color = "orange"
      @api_description = "The Air quality is Unhealthy for Senesitive  Groups"
    elsif @final_output >= 151 && @final_output <=200 
      @api_color = "red"
      @api_description = "The Air quality is Unhealthy"
    elsif @final_output >= 201 && @final_output <=300 
      @api_color = "purple"
      @api_description = "The Air quality is very Unhealthy and farely Dangerous"
    elsif @final_output >= 301 && @final_output <=500 
      @api_color = "marron"
      @api_description = "The Air quality is Harzardous and Really Dangerous"
    end

  end

  def zipcode
    @zip_query = params[:zipcode]
    if params[:zipcode] == ""
      @zip_query = "Hey ! You forgot to enter a zipcode"
    elsif params[:zipcode]
      #do API stuff



      require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + @zip_query + '&distance=0&API_KEY=DEBCA64B-1844-4C7C-8207-65BE6815683D'
    @uri =  URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    #check for empty results
    if @output.empty?
        @final_output = "Error"
    else
      @final_output = @output [0]["AQI"]
    end

    if @final_output == "Error" 
      @api_color = "grey"
      @api_description = "Try to enter the zipcode again !!!"
    elsif @final_output <= 50 
      @api_color = "green"
      @api_description = "The Air quality is Good and Healthy"
    elsif @final_output >= 51 && @final_output <=100 
      @api_color = "yellow"
      @api_description = "The Air quality is Moderate"
    elsif @final_output >= 101 && @final_output <=150 
      @api_color = "orange"
      @api_description = "The Air quality is Unhealthy for Senesitive  Groups"
    elsif @final_output >= 151 && @final_output <=200 
      @api_color = "red"
      @api_description = "The Air quality is Unhealthy"
    elsif @final_output >= 201 && @final_output <=300 
      @api_color = "purple"
      @api_description = "The Air quality is very Unhealthy and farely Dangerous"
    elsif @final_output >= 301 && @final_output <=500 
      @api_color = "marron"
      @api_description = "The Air quality is Harzardous and Really Dangerous"
    end





    end
  end

end
