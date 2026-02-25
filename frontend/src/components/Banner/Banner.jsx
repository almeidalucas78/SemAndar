import "./Banner.css";
import ButtonSingUp from "../ButtonSingUp/ButtonSingUp";


const BANNER_CONTENT = {
  title: "Bem-vindo ao SemAndar",
  description: "Explore nossa seleção exclusiva de propriedades requintadas, meticulosamente projetadas para atender à sua visão única da casa dos sonhos.",
  buttonText: "Cadastre-se"
}

const Banner = () => {
  return (
    <section className="banner">
      <div className="container mx-auto px-4 py-20">
        <div className="w-full lg:w-1/3 text-left">
          <h1 className="text-4xl md:text-6xl font-extrabold text-slate-900 mb-4 tracking-tight">{BANNER_CONTENT.title}</h1>
          <p className="text-lg md:text-xl text-slate-500 mb-10 max-w-lg leading-relaxed">{BANNER_CONTENT.description}</p>
          <ButtonSingUp>Cadastre-se</ButtonSingUp>
        </div>
      </div>
    </section>

  );
}
export default Banner;

