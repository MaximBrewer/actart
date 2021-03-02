<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\User;

class Reminder extends Notification
{
    use Queueable;


    protected $auction;
    protected $user;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($auction, $user)
    {
        $this->auction = $auction;
        $this->user = $user;
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Act-Art.ru - напоминание об аукционе')
            ->greeting("Напоминание об аукционе на сайте Act-Art.ru.")
            ->line('Вы хотели принять участие в аукционе ' . $this->auction->title)
            ->line('Аукцион состоится ' . $this->auction->dateout)
            ->action('Перейти к аукциону', "https://act-art.ru/auctions/" . $this->auction->id);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
