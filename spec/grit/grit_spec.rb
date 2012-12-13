spec_dir = File.expand_path 'spec'
require File.join spec_dir, 'spec_helper'

require 'grit'

describe 'Grit' do

  let(:learning_ruby) do
    File.dirname spec_dir
  end

  it 'can work with an existing repository' do
    lambda {
      repo = Grit::Repo.new learning_ruby
      repo.should_not be_nil
    }.should_not raise_error
  end

  context 'with an existing repository' do

    before :each do
      @learning_ruby = Grit::Repo.new learning_ruby
    end

    it 'can list commits' do
      @learning_ruby.commits.should_not be_nil
    end

    describe '.commits' do

      it 'returns up to 10 commits' do
        @learning_ruby.commits.size.should == 10
      end

      it 'can return a specific commit' do
        first_commit = @learning_ruby.commits('1d89b84d0c13b76019006a31d973c17d3ce9928e')[0]
        first_commit.id.should == '1d89b84d0c13b76019006a31d973c17d3ce9928e'
      end

      describe 'Commit' do

        before :each do
          @first = @learning_ruby.commits('1d89b84d0c13b76019006a31d973c17d3ce9928e')[0]
        end

        it 'has an id' do
          @first.id.should == '1d89b84d0c13b76019006a31d973c17d3ce9928e'
        end

        it 'knows about its parents' do
          @first.parents.size.should == 0
        end

        it 'knows who authored it' do
          actor = @first.author
          actor.name.should == 'Jed Northridge'
          actor.email.should == 'northridge@gmail.com'
        end

        it 'knows who committed it' do
          actor = @first.committer
          actor.name.should == 'Jed Northridge'
          actor.email.should == 'northridge@gmail.com'
        end

        it 'knows when it was authored' do
          time = @first.authored_date
          time.to_s.should =~ /2012-12-11 06:11:04 -0500/
        end

        it 'knows when it was committed' do
          time = @first.committed_date
          time.to_s.should =~ /2012-12-11 06:11:53 -0500/
        end

        it 'knows the commit message' do
          @first.message.should =~ /Learning Ruby with RSpec/
        end

        it 'has an associated Tree' do
          @first.tree.should_not be_nil
        end

      end

      describe 'Tree' do

        before :each do
          first_commit = @learning_ruby.commits('1d89b84d0c13b76019006a31d973c17d3ce9928e')[0]
          @tree = first_commit.tree
        end

        it 'knows its contents' do
          initial_contents = @tree.contents
          initial_contents.size.should == 3
          initial_file_names = initial_contents.collect do |blob|
            blob.name
          end
          [ '.rvmrc', 'Gemfile', 'Gemfile.lock' ].should == initial_file_names
        end

      end

    end
  end
end
