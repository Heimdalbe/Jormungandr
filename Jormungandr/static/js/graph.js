/**
All interactions needed in the praesidium.html template are handled here
*/

function initGraph(data){

            console.log(data)
            var chart = anychart.graph(data);
            // set title
            chart.title("Heimdal peter/meter stamboom");
            // access nodes
            var nodes = chart.nodes();

            // set the size of nodes
            nodes.normal().height(30);
            nodes.hovered().height(45);
            nodes.selected().height(45);

            chart.nodes().tooltip().useHtml(true);
            chart.nodes().tooltip().format(
            "<span style='font-weight:bold'>{%display}</span><br>group: {%group}"
            );
            // set the stroke of nodes
            nodes.normal().stroke(null);
            nodes.hovered().stroke("#333333", 3);
            nodes.selected().stroke("#333333", 3);
            // draw chart
            chart.container("graph-container").draw();
    }
