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
      # binding.pry
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
      
    elsif req.path.match(/patients/) && req.post?
      # data = JSON.parse(req.body.read)
      # patient_in = Patient.find_by(name: data["name"])
      # binding.pry
      # return[200, { 'Content-Type' => 'application/json' }, [ {:data => Patient.all}.to_json ]]

      # if patient_in
      #   [200, { 'Content-Type' => 'application/json' }, [ { :error => "The patient #{data["name"]}, is already on file!"}.to_json ]]
      # else
      #   Patient.create(name: "name", condition: "condition")
      #   [200, { 'Content-Type' => 'application/json' }, [ {:message => "#{Patient.last["name"]} has been added!"}.to_json ]]
      # end

    elsif req.path.match(/doctors/) && req.post?
      # user is asking to see doctor data...response is the doctors information. Name and Specialty
      # data = JSON.parse(req.post.read)
      binding.pry
      # doctor_in = Doctor.find_by(name: data["name"])
      return[200, { 'Content-Type' => 'application/json' }, [ {:data => Doctor.all}.to_json ]]
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end
