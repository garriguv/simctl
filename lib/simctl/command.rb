require 'simctl/command/boot'
require 'simctl/command/create'
require 'simctl/command/delete'
require 'simctl/command/erase'
require 'simctl/command/install'
require 'simctl/command/io'
require 'simctl/command/kill'
require 'simctl/command/launch'
require 'simctl/command/list'
require 'simctl/command/openurl'
require 'simctl/command/rename'
require 'simctl/command/reset'
require 'simctl/command/shutdown'
require 'simctl/command/spawn'
require 'simctl/command/uninstall'
require 'simctl/command/warmup'
require 'simctl/executor'
require 'shellwords'

module SimCtl
  class Command
    attr_accessor :device_set_path

    include SimCtl::Command::Boot
    include SimCtl::Command::Create
    include SimCtl::Command::Delete
    include SimCtl::Command::Erase
    include SimCtl::Command::IO
    include SimCtl::Command::Install
    include SimCtl::Command::Kill
    include SimCtl::Command::Launch
    include SimCtl::Command::List
    include SimCtl::Command::OpenUrl
    include SimCtl::Command::Rename
    include SimCtl::Command::Reset
    include SimCtl::Command::Shutdown
    include SimCtl::Command::Spawn
    include SimCtl::Command::Uninstall
    include SimCtl::Command::Warmup

    def device_set_path=(device_set_path)
      @device_set_path = File.expand_path(device_set_path)
    end

    def command_for(*arguments)
      command = %w[xcrun simctl]
      command += ['--set', Shellwords.shellescape(device_set_path)] unless device_set_path.nil?
      command += arguments
      command
    end
  end
end
