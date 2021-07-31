class Application
  # determining response based on request
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/test/)
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]


# <--- PATIENT GET REQUEST START --->


    elsif req.path.match(/patients/) && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ {:data => Patient.all}.to_json ]]


# <--- PATIENT GET REQUEST END --->


# <--- PATIENT POST REQUEST START --->


    elsif req.path.match(/patients/) && req.post?
      data = JSON.parse(req.body.read)
      patient_in = Patient.find_by(first_name: data["first_name"], last_name: data["last_name"])
      if !patient_in
        Patient.create(first_name: data["first_name"], last_name: data["last_name"], condition: data["condition"], is_admitted: true)
        # patient = Patient.create(data)
        req_patient = {id: Patient.last["id"], first_name: data["first_name"], last_name: data["last_name"], condition: data["condition"], is_admitted: true}
        # req_patient = {id: patient.id, first_name: patient.first_name, last_name: patient.last_name, condition: patient.condition, is_admitted: true}
        return [200, { 'Content-Type' => 'application/json' }, [ {:patient => req_patient, :message => "Patient has been added!" }.to_json ]] 
        # "#{Patient.last["first_name"]} has been added!"
      else
        return [200, { 'Content-Type' => 'application/json' }, [ { :error => "Patient is already on file!"}.to_json ]]
      end


# <--- PATIENT POST REQUEST END --->


# <--- PATIENT DELETE REQUEST START ---->


    elsif req.delete?
      # binding.pry
      id = req.path.split("/patients/").last
      Patient.find(id).delete
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "Patient Deleted!"}.to_json ]]


# <--- PATIENT DELETE REQUEST END --->


# <--- DOCTOR GET REQUEST START --->


    elsif req.path.match(/doctors/) && req.get?
      # user is asking to see doctor data...response is the doctors information. Name and Specialty
      # data = JSON.parse(req.post.read)
      # binding.pry
      # doctor_in = Doctor.find_by(name: data["name"])
      return[200, { 'Content-Type' => 'application/json' }, [ {:data => Doctor.all}.to_json ]]


# <--- DOCTOR GET REQUEST END --->


# <--- WRONG PATH START --->


    else
      resp.write "Path Not Found"
    end


# <--- WRONG PATH END --->

    
    resp.finish
  end

end
