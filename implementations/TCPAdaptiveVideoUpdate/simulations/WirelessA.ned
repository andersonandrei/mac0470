//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package tcpadaptivevideoupdate.simulations;

import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;


network WirelessA
{
    parameters:
        string hostType = default("WirelessHost");
        string mediumType = default("IdealRadioMedium");

        @display("bgb=800,800;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=350,20; anchor=w; font=,18; textFormat="packets received client: %g"; initialValue=0);
        @statistic[rcvdPk](source=client.tcpApp[0].rcvdPk; record=figure(count); targetFigure=rcvdPkText);


    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer if hasVisualizer() {
            @display("p=78.792,93.264;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=78.792,168.84;is=s");
        }
        server: <hostType> like INetworkNode {
            @display("p=155.976,453.456");
        }
        client: <hostType> like INetworkNode {
            @display("p=614.256,453.456");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=77.184,236.376;is=vs");
        }
    connections:
}
