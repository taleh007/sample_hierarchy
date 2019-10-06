require 'rails_helper'

RSpec.describe SitePoint, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'Name'
    subject.path = 'qwe'
    expect(subject).to be_valid
  end

  it 'is not valid with blank path and existed parent_id' do
    subject.name = 'Name'
    subject.path = nil
    subject.parent_id = 22

    expect(subject).to_not be_valid
    expect(subject.errors.count).to eq(1)
  end

  it 'is not valid without name' do
    subject.name = nil

    expect(subject).to_not be_valid
    expect(subject.errors.count).to eq(1)
  end

  it 'creates links between models in one hierarchy ' do
    subject.name = 'grandparent'
    subject.path = 'foo'

    expect(subject.save).to eq(true)
    parent = described_class.create(parent: subject, name: "parent", path: "bar")

    expect(parent.save).to  eq(true)
    expect(parent.depth).to eq(1)

    child = parent.children.create(name: 'Parent', path: 'hello')

    expect(child.save).to  eq(true)
    expect(child.depth).to eq(2)
    expect(child.self_and_ancestor_ids).to eq([child.id, parent.id, subject.id])
    expect(subject.root_of?(child)).to  eq(true)
  end
end
