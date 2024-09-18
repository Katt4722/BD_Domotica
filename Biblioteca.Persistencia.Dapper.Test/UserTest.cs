namespace Biblioteca.Persistencia.Dapper.Test;

public class UserTest : TestBase
{
    public UserTest() : base() { }

    [Fact]
    public void AltaUsuarioOK()
    {
        var brenda = new Usuario()
        {
            Nombre = "Brenda",
            Telefono = "238238",
            Correo = "bren@da.com",
            Contrasenia = "123456"
        };

        Ado.AltaUsuario(brenda);

        Assert.NotEqual(0, brenda.IdUsuario);
    }
}