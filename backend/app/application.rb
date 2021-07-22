class Application

  # determining response based on request
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # if patient is entered in, what happens?
      # patient info is put in and if not already in, create and save new patient 
      # either information is successfully put in or
      # patient is already in and 
    
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path.match(/patients/)
      # patient_exist = Patient.find_by(name: data["name"])
      # if patient_exist
      #   [200, { 'Content-Type' => 'application/json' }, [ { :error => "The patient #{patient_exist.name} is already on file!"}.to_json ]]
      # else
      #   [200, { 'Content-Type' => 'application/json' }, [ {:data => {}}.to_json ]]
      # end
      
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Patient.all}.to_json ]]
    elsif req.path.match(/doctors/)
      return[200, { 'Content-Type' => 'application/json' }, [ {data: Doctor.all}.to_json ]]
    else
      resp.write "Path Not Found bo"
    end
    resp.finish
  end

end
