defmodule LiveviewNotionWeb.PageLive do
  use LiveviewNotionWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do

    #ENVÍO EL ATOMO TICK A MI MISMO CADA 1 SEGUNDO, MÁS ABAJO TENGO UN HANDLE INFO QUE LO RECIBE
    if connected?(socket) do
      :timer.send_interval(500, self(), :tick)
      :timer.send_interval(1000, self(), :tick2)
    end

    {:ok,
     assign(
       socket,
       contador: 0,
       temperatura: 0,
       humedad: 0,
       volumen: 0,
       usuarios_conectados: 0
     )}

    end

  #EJEMPLOR DE LIVEVIEW A JS (CON EL TICKER2 DE ARRIBA DISPARAMOS ESTE HANDLE INFO CADA UN SEGUNDO...)
  @impl true
  def handle_info(:tick2, socket) do
    socket = assign(socket, usuarios_conectados: Enum.random(0..100))
    {:noreply, push_event(socket, "phxToJs", %{value: "Esto viene del LView "})}
  end

  # EJEMPLO DE JS A LIVEVIEW
  def handle_event("jsToPhx", params, socket) do
      IO.puts("RECIBIDO")
      IO.inspect(params)
      {:reply, %{respuesta: "Al hacer clic en el botón, disparamos un evento desde el front al back, y el back emitió respuesta, esta respuesta vino desde el backend y entra al hook como 'reply'"}, socket}
  end


  # EJEMPLO USUARIOS CONECTADOS (recibo el mensaje tick que me envio a mi mismo cada un segundo mirar que me lo envio desde el mount, una vez recibido el mensaje, lo asigno en el socket, y luego lo mandamos para el front)
  @impl true
  def handle_info(:tick, socket) do
    socket = assign(socket, usuarios_conectados: Enum.random(0..100))
    {:noreply, socket}
  end

  # EJEMPLO POTENCIOMENTRO
  @impl true
  def handle_event("pote_update", %{"volumen" => volumen}, socket) do
    socket = assign(socket, volumen: volumen)
    {:noreply, socket}
  end

  # EJEMPLO BOTON CON VALORES
  @impl true
  def handle_event("suma1", %{"temperatura" => temperatura, "humedad" => humedad}, socket) do
    socket = assign(socket, temperatura: temperatura, humedad: humedad)
    {:noreply, socket}
  end

  # EJEMPLO BOTON SUMA 1
  @impl true
  def handle_event("suma1", _, socket) do
    contador = socket.assigns.contador + 1
    socket = assign(socket, contador: contador)
    {:noreply, socket}
  end
end
