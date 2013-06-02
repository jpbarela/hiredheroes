require 'net/http'
require 'nokogiri'

class Job

  attr_accessor :name, :company, :salary, :description, :did 
  
  def detail_link
    return "http://www.careerbuilder.com/JobSeeker/Jobs/JobDetails.aspx?APath=2.31.0.0.0&job_did=#{self.did}&IPath=ILKV0C"
  end 
  
  def self.find_by_moc_code_and_zip_code(moc_code, zip_code)
    url = URI.parse('http://api.careerbuilder.com/v1/jobsearch')
    keywords = ""
    moc_code.keywords.each do |keyword|
      keywords += keyword.keyword.gsub(/\s/, '_').gsub(/"/,'')
    end 
    url.query = "DeveloperKey=#{ENV["CAREER_BUILDER"]}&Location=#{zip_code}&Keywords=#{keywords}"
    #puts url.to_s 
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    doc = Nokogiri::XML(res.body)
    doc.to_s
    jobs = []
    doc.xpath("//JobSearchResult").each do |job_xml|
      job = Job.new
      job.name = job_xml.value("JobTitle")
      job.company = job_xml.value("Company") 
      job.salary = job_xml.value("Pay") 
      job.description = job_xml.value("DescriptionTeaser")
      job.did = job_xml.value("DID")
      jobs.push(job)
    end
    return jobs
  end

end

class Nokogiri::XML::Element
  
  def value(path)
    return self.xpath(path).first.to_s.gsub("<#{path}>", "").gsub("</#{path}>", "")
  end
  
end