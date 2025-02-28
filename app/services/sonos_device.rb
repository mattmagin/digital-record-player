require 'pycall'
require 'pycall/import'

include PyCall::Import

pyimport :soco
sonosControlModule = PyCall.import_module("soco")
ShareLinkPlugin = PyCall.import_module('soco.plugins.sharelink').ShareLinkPlugin
DiscoveryPlugin = PyCall.import_module('soco.discovery')

class SonosDevice
    def initialize(name)
        @device = DiscoveryPlugin.by_name(name)
        @share_link = ShareLinkPlugin.new(@device)

        @device
    end

    def clear_queue
        @device.clear_queue();
    end

    def play
        @device.play();
    end

    def isValid(uri)
        @share_link.is_share_link(uri)
    end
 
    def queue_request(request)
        begin
            puts @device
            @device.clear_queue()
            share_link = ShareLinkPlugin.new(@device)
            puts share_link
            
            share_link.add_share_link_to_queue(request, 2) 
        rescue => e
            puts e
        end
    end
end