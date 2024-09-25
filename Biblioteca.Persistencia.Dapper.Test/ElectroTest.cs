namespace Biblioteca.Persistencia.Dapper.Test;

public class ElectroTest : TestBase
{
    public ElectroTest() : base() { } 
    [Fact]
    public void AltaElectroOK()
    {
        var Lavarropa = new Electrodomestico()
        {
            Nombre = "Lavarropa",
            Tipo = "Automatico",
            Ubicacion = "Lavanderia",
            Encendido = false
        };
    }
}