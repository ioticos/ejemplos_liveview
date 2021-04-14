defmodule LiveviewNotionWeb.ComponentesLive do

  use LiveviewNotionWeb, :live_view

  alias LiveviewNotionWeb.ContadorComponent
  alias LiveviewNotionWeb.SumadorComponent

  def mount(_param, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""

    <h1>COMPONENTE STATELESS</h1>

    ⬇aquí dentro renderizaremos los componentes⬇
    <hr>
        <%= live_component @socket, ContadorComponent, valor_inicial: 10, incremento: 2 %>
        <hr>
        <%= live_component @socket, ContadorComponent, valor_inicial: 120, incremento: 21 %>
    <hr>
    ⬆aquí dentro renderizaremos los componentes⬆

    <br><br><br><br>


    <h1>COMPONENTE STATEFULL</h1>

    ⬇aquí dentro renderizaremos los componentes⬇
    <hr id="componentes">
        <%= live_component @socket, SumadorComponent, incremento: 2,  valor_inicial: 10, id: 1 %>
        <br><br>
        <%= live_component @socket, SumadorComponent, incremento: 12,  valor_inicial: 110, id: 2 %>
    <hr>
    ⬆aquí dentro renderizaremos los componentes⬆
    """








  end



end
