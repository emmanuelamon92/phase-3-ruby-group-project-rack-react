class Application
  # determining response based on request
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/test/)

      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

# <-- PATIENT GET START -->
    elsif req.path.match(/patients/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:data => Patient.all}.to_json ]]
# <-- PATIENT GET START -->

# <-- PATIENT POST START-->
    elsif req.path.match(/patients/) && req.post?
      data = JSON.parse(req.body.read)
      patient_in = Patient.find_by(first_name: data["first_name"], last_name: data["last_name"])
      if !patient_in
        Patient.create(first_name: data["first_name"], last_name: data["last_name"], condition: data["condition"], is_admitted: true)
        
        [200, { 'Content-Type' => 'application/json' }, [ {:message => "#{Patient.last["first_name"]} has been added!"}.to_json ]]
      else
        [200, { 'Content-Type' => 'application/json' }, [ { :error => "The patient #{data["first_name"]}, is already on file!"}.to_json ]]
      end
# <-- PATIENT-POST-END -->

# <-- PATIENT-DELETE-START -->
    elsif req.delete?
      # binding.pry
      id = req.path.split("/patients/").last
      Patient.find(id).delete
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "Patient Deleted!"}.to_json ]]
# <-- PATIENT-DELETE-END-->

    elsif req.path.match(/doctors/) && req.get?
      # user is asking to see doctor data...response is the doctors information. Name and Specialty
      # data = JSON.parse(req.post.read)
      # binding.pry
      # doctor_in = Doctor.find_by(name: data["name"])
      return[200, { 'Content-Type' => 'application/json' }, [ {:data => Doctor.all}.to_json ]]
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end
