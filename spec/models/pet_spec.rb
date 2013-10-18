require "spec_helper"

describe Pet do
  subject { Pet.new { |p| p.name = "Lila"; p.sex = "Girl"; p.child = User.new; p.character = Character.new(name: "bear") } }

  describe "#coins" do
    before { subject.stub(:points).and_return([100, 20, 3]) }
    it { subject.coins.should == 123 }
  end

  describe "#health_index" do
    let(:items) { [] }

    before do
      subject.stub(:last_items).and_return(items)
    end

    it { subject.health_index.should be_nil }

    it {
      items << Item.new(qualification: "a-good")
      subject.health_index.should == 1
    }

    it {
      items << Item.new(qualification: "b-neutral")
      subject.health_index.should == 0.5
    }

    it {
      items << Item.new(qualification: "c-bad")
      subject.health_index.should == 0
    }

    it {
      items << Item.new(qualification: "a-good") << Item.new(qualification: "c-bad")
      subject.health_index.should == 0.5
    }

    it {
      items << Item.new(qualification: "a-good") << Item.new(qualification: "c-bad") <<
        Item.new(qualification: "b-neutral")
      subject.health_index.should == 0.5
    }

    it {
      items << Item.new(qualification: "a-good") << Item.new(qualification: "c-bad") <<
        Item.new(qualification: "c-bad")
      subject.health_index.should == 0.33
    }
  end

  describe "#health_level" do
    it "nil should be 3" do
      subject.stub(:health_index).and_return(nil)
      subject.health_level.should eq 3
    end

    it "0.0 should be 0" do
      subject.stub(:health_index).and_return(0.0)
      subject.health_level.should eq 0
    end

    it "0.1 should be 0" do
      subject.stub(:health_index).and_return(0.1)
      subject.health_level.should eq 0
    end

    it "0.2 should be 0" do
      subject.stub(:health_index).and_return(0.2)
      subject.health_level.should eq 0
    end

    it "0.21 should be 1" do
      subject.stub(:health_index).and_return(0.21)
      subject.health_level.should eq 1
    end

    it "0.3 should be 1" do
      subject.stub(:health_index).and_return(0.3)
      subject.health_level.should eq 1
    end

    it "0.4 should be 1" do
      subject.stub(:health_index).and_return(0.4)
      subject.health_level.should eq 1
    end

    it "0.41 should be 2" do
      subject.stub(:health_index).and_return(0.41)
      subject.health_level.should eq 2
    end

    it "0.5 should be 2" do
      subject.stub(:health_index).and_return(0.5)
      subject.health_level.should eq 2
    end

    it "0.6 should be 2" do
      subject.stub(:health_index).and_return(0.6)
      subject.health_level.should eq 2
    end

    it "-.61 should be 3" do
      subject.stub(:health_index).and_return(0.61)
      subject.health_level.should eq 3
    end

    it "0.7 should be 3" do
      subject.stub(:health_index).and_return(0.7)
      subject.health_level.should eq 3
    end

    it "0.8 should be 3" do
      subject.stub(:health_index).and_return(0.8)
      subject.health_level.should eq 3
    end

    it "0.81 should be 4" do
      subject.stub(:health_index).and_return(0.81)
      subject.health_level.should eq 4
    end

    it "0.9 should be 4" do
      subject.stub(:health_index).and_return(0.9)
      subject.health_level.should eq 4
    end

    it "1.0 should be 4" do
      subject.stub(:health_index).and_return(1.0)
      subject.health_level.should eq 4
    end
  end

  describe "#feeling" do
    it "should be very sad" do
      subject.stub(:health_level).and_return(0)
      subject.feeling.should == "very sad"
    end

    it "should be upset" do
      subject.stub(:health_level).and_return(1)
      subject.feeling.should == "upset"
    end

    it "should be ok" do
      subject.stub(:health_level).and_return(2)
      subject.feeling.should == "ok"
    end

    it "should be good" do
      subject.stub(:health_level).and_return(3)
      subject.feeling.should == "good"
    end

    it "should be great!" do
      subject.stub(:health_level).and_return(4)
      subject.feeling.should == "great!"
    end
  end

  describe "#health_icon" do
    it "should be very sad" do
      subject.stub(:health_level).and_return(0)
      subject.health_icon.should == "/images/scale/state-1.png"
    end

    it "should be upset" do
      subject.stub(:health_level).and_return(1)
      subject.health_icon.should == "/images/scale/state-2.png"
    end

    it "should be ok" do
      subject.stub(:health_level).and_return(2)
      subject.health_icon.should == "/images/scale/state-3.png"
    end

    it "should be good" do
      subject.stub(:health_level).and_return(3)
      subject.health_icon.should == "/images/scale/state-4.png"
    end

    it "should be great!" do
      subject.stub(:health_level).and_return(4)
      subject.health_icon.should == "/images/scale/state-5.png"
    end
  end

  describe "#pet_image" do
    it "should be very sad" do
      subject.stub(:health_level).and_return(0)
      subject.pet_image.should == "/images/pets/bear_sick.svg"
    end

    it "should be upset" do
      subject.stub(:health_level).and_return(1)
      subject.pet_image.should == "/images/pets/bear_nogood.svg"
    end

    it "should be ok" do
      subject.stub(:health_level).and_return(2)
      subject.pet_image.should == "/images/pets/bear_normal.svg"
    end

    it "should be good" do
      subject.stub(:health_level).and_return(3)
      subject.pet_image.should == "/images/pets/bear_happy.svg"
    end

    it "should be great!" do
      subject.stub(:health_level).and_return(4)
      subject.pet_image.should == "/images/pets/bear_ecstatic.svg"
    end
  end

  describe "#eating_image" do
    it { subject.pet_eating_image.should == "/images/pets/bear_eating.svg" }
  end
end
