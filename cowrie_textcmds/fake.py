from cowrie.shell.command import HoneyPotCommand

class command_fake(HoneyPotCommand):
    def call(self):
        self.write("This is a fake mycmd output.\n")
        self.exit()
