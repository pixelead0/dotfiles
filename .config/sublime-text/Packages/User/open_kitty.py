import sublime
import sublime_plugin
import subprocess
import os

class OpenKittyCommand(sublime_plugin.WindowCommand):
    def run(self):
        # Tomar la ruta del archivo activo o la primera carpeta del proyecto
        view = self.window.active_view()
        path = None
        if view and view.file_name():
            path = os.path.dirname(view.file_name())
        elif self.window.folders():
            path = self.window.folders()[0]
        else:
            path = os.path.expanduser("~")

        subprocess.Popen(["kitty", "--directory", path])
