defmodule LiveviewNotionWeb.SumadorComponent do
  use LiveviewNotionWeb, :live_component

  def mount(socket) do
    # AQUI PUEDO DECLARAR VALORES INICIALES SI LOS NECESITARE
    socket = assign(socket, cuenta: 0)
    {:ok, socket}
  end

  #si implemento update se puede usar para hacer operaciones luego de que renderice
  def update(assigns, socket) do
    socket = assign(socket, assigns) #si voy a implementar update si o si debo asignar los assigns al socket
    socket = assign(socket, cuenta: assigns.valor_inicial)
    {:ok, socket}
  end


  def render(assigns) do
    ~L"""
<div>
    Valor Inicial -> <%= @valor_inicial %>
    <br>
    Incremento -> <%= @incremento%>
    <br>
    Cuenta -> <%= @cuenta %>
    <br><br>
    <button phx-click="ejecuta" phx-target="<%= @myself %>" >EJECUTA</button>
</div>
    """

  end

  # EJEMPLO DE JS A LIVEVIEW
  def handle_event("ejecuta", params, socket) do
    IO.puts("RECIBIDO")
    cuenta = socket.assigns.cuenta + socket.assigns.incremento
    socket = assign(socket, cuenta: cuenta)
    {:noreply, socket}
  end
end
