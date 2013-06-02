require 'net/http'
require 'nokogiri'

class Job

  attr_accessor :name, :company, :salary, :description
           
  def self.new 
    super
    
  end
           
  def self.find_by_moc_code_and_zip_code(moc_code, zip_code)
=begin
    job = Job.new 
    job.name =  "Test Job"
    job.company = "Test Company" 
    job.salary = 45000
    job.description = "A fun job with no stress"
    return [job]
=end
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
      #puts job_xml.to_s 
      job.name = job_xml.value("JobTitle") #xpath("JobTitle").to_s
      job.company = job_xml.value("Company") #xpath("Company").to_s 
      job.salary = job_xml.value("Pay") #xpath("Pay").to_s #.value("Pay")
      job.description = job_xml.value("DescriptionTeaser") #("DescriptionTeaser").to_s 
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