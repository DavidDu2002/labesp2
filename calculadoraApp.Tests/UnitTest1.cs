using Xunit;
namespace calculadoraApp.Tests
{   
    public class CalculadoraTest
    {
        [Fact]
        public void Sumar_DosNumeros_VerificaSumaCorrect()

        {
            var calc = new calculadoraApp.calculadora();
            var resultado = calc.Sumar(3, 3);
            Assert.Equal(5, resultado);
        }
    }

}

