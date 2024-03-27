describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hq = AvangersHeadQuarter.new

    hq.put["SpiderMan"]

    expect(hq).to eql "SpiderMan"
  end
end
