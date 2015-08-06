require "spec_helper"
require "ostruct"

describe ParamsBuilder do
  it "builds expected params" do
    company_params = {
      name: "apple",
      logo: "xxx.jpg",
      owner: "jack",

      images_attributes: [
        {
          url: "a.jpg"
        },
        {
          url: "b.jpg"
        }
      ]
    }

    owner = OpenStruct.new(name: "jack")
    company = OpenStruct.new(name: "apple", logo: "xxx.jpg")

    expect(
      ParamsBuilder.build(:company_params, owner: owner, company: company)
    ).to eq company_params.deep_stringify_keys
  end
end
