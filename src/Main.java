import org.jpl7.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args) {

        String connectionStr = "consult('routes.pl').";
        Query connection = new Query(connectionStr);

        if(!connection.hasSolution()){
            System.out.println("The prolog file was not found");
            return;
        }

        System.out.println("Connected to the prolog knowledge source");

        String routeString = "ruta(casa, salon, Ruta).";

        Query routeQuery = new Query(routeString);

        Term routesTerm = routeQuery.oneSolution().get("Ruta");

        List<String> routes = new ArrayList<>();

        while (routesTerm.isListPair()){
            routes.add(routesTerm.arg(1).toString());
            routesTerm = routesTerm.arg(2);
        }

        System.out.println("----------------------------");
        System.out.println("The route to arrive from the house to the salon is: ");
        System.out.println(routes);
    }
}